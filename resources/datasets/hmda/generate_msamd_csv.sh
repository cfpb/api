#! /bin/bash
#
# Background:
# This script can be used to import an XLSX or CSV file that contains MSA codes
# and names. These fields will be pulled out and placed into a CSV formatted
# file appropriate for appending to code_sheets/msamd.csv.
#
# The expected input format:
#     code column: MSA code (e.g. 47894)
#     name_column: MSA name (e.g. "WASHINGTON-ARLINGTON-ALEXANDRIA, DC-VA-MD-WV")
#
# The output format:
#     year_column: (optional)
#     code column: MSA code (e.g. 47894)
#     name_column: pretty MSA name (e.g. "Washington, Arlington, Alexandria - DC, VA, MD, WV")
#
# Requirements:
#     xlsx2csv (pip install xlsx2csv) required if using an xlsx file
#     sed (Mac users: install a newer version of sed: `brew install gnu-sed`)
#

# NOTE - if using OSX, you'll need to install a newer version of sed to support these queries.
# for OSX (old BSD sed) --version flag doesn't exist;
# use --version to detect when you need to install gsed
sed_bin='sed'
command -v gsed 2> /dev/null && {
  sed_bin='gsed'
}
$sed_bin --version > /dev/null
if [ $? != 0 ]; then
    echo 'Please install gsed with `brew install gnu-sed` in order to use this script'
    echo 'exiting'
    exit 1
fi


CSV_APPEND_FILE=
CODE_COLUMN=1
NAME_COLUMN=2
INPUT_TYPE=csv
PREPEND_YEAR=
OPTIONS_GUIDE="Usage: $0 [-c code-column] [-n name-column] [-a csv-append-file] [-t input-type] [-y year] input-file
    -c	Default: $CODE_COLUMN
    -n	Default: $NAME_COLUMN
    -a	Append results to provided filename
    -t  Options: csv, xlsx, tab	Default: $INPUT_TYPE
    -y  Prepend year as first column of csv
"

# Pull out the command line arguments (if any)
while getopts ":c:n:a:t:y:h" opt; do
    case $opt in
        c)
            CODE_COLUMN=$OPTARG
            ;;
        n)
            NAME_COLUMN=$OPTARG
            ;;
        a)
            CSV_APPEND_FILE=$OPTARG
            ;;
        t)
            case "$OPTARG" in
                csv|xlsx|tab)
                    INPUT_TYPE=$OPTARG
                    ;;
                *)
                    echo "Invalid file type specified" >&2
                    echo "$OPTIONS_GUIDE" >&2
                    echo 1
                    ;;
            esac
            ;;
        y)
            PREPEND_YEAR=$OPTARG
            ;;
        h)
            echo "$OPTIONS_GUIDE" >&2
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "$OPTIONS_GUIDE" >&2
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))  #This tells getopts to move on to the next argument.

if [ $# -ne 1 ]; then
     echo "Please include the input file"
     echo "$OPTIONS_GUIDE" >&2
     exit 1
fi
INPUT_FILE=$1

if [[ -n "$CSV_APPEND_FILE" && -z "$PREPEND_YEAR" ]] ; then
    echo "If appending to an existing CSV file, please define the year"
    exit 1
fi

echo $INPUT_TYPE
if [ $INPUT_TYPE = 'xlsx' ]; then
    # Use xlsx2csv to convert the xlsx file: https://github.com/dilshod/xlsx2csv
    # If xlsx2csv is not installed, exit
    command -v xlsx2csv 2> /dev/null || {
        echo >&2 "'xlsx2csv' is required for this script to execute. To install, run:
pip install xlsx2csv 
Note that root access may be required to run pip commands. Aborting.";
        exit 1;
    }
fi

sed_tweaks='
  # sed input format       47894,"WASHINGTON-ARLINGTON-ALEXANDRIA, DC-VA-MD-WV",
  # sed output format      47894,"Washington, Arlington, Alexandria - DC, VA, MD, WV"
  # Note: also works if | is the delimiter

  # remove any line that does not contain a 5 character integer (MSA code)
  # i.e. remove any header rows
  /[0-9]\{5\}[,|]/!d;

  # remove the delimiter (| or ,) at the end of every line
  s/[,|]$//;

  # replace comma separating city block and state block
  s/, / - /;

  # replace hyphens between citys with comma and a space
  # first, replace both - or / with ", " unless -- appears in the string
  /--/!s/\([A-Z]\)\(-\|\/\)\([A-Z]\)/\1, \3/g;
  # for lines that have --, replace -- with , but leave - as is
  s/\([A-Z]\)--\([A-Z]\)/\1, \2/g;

  # remove "CBSA" from MSA codes, if present
  s/CBSA\([0-9]\{5\}\)/\1/;

  # Replaces UTF-8 Characters with ascii equivalent
  s/[ÀÂÄÁ]/A/g; s/[ÉÈÊË]/E/g; s/[ÎÏ]/I/g; s/[Ü]/U/g

  # lowercase words (2+ chars), but keep the first letter capitalized
  s/\b\([[:alpha:]]\)\([[:alpha:]]\+\)\b/\u\1\L\2/g;

  # uppercase any words that follow " - ", as those are state abbreviations
  s/\( \- \(\(, \)\?[A-Z][a-z]\)\+\)/\U\1/;

  # special case - uppercase the abbreviations in MSA #99999
  s/Na (Outside Of Msa, Md)/NA (Outside Of MSA\/MD)/;

  # Remove MSA 00000, if present
  /00000[,|]/d;

  # remove quotes from lines without commas
  s/"\([^,]\+\)"/\1/;

  # Captialization Exceptions
  s/Fond Du Lac/Fond du Lac/g;
  s/Mcallen/McAllen/g;

  # DOS/Windows formatted text files have \r for endline delimiters that 
  # unix has trouble interpretting
  s/\r//g;
'

if [ $INPUT_TYPE = 'xlsx' ]; then
    # xlsx2csv gracefully handles unicode nastiness, thankfully.
    dump_cmd="xlsx2csv -d '|' \"$INPUT_FILE\""
elif [ $INPUT_TYPE = 'tab' ]; then
    # replace tab with a | 
    dump_cmd="cat \"$INPUT_FILE\" |$sed_bin  's/\t/|/'"
else
    # To make the output match xlsx2csv...
    # replace only the first comma with a |
    # remove any quotes and end-of-line commas
    dump_cmd="cat \"$INPUT_FILE\" | $sed_bin 's/,/|/' | $sed_bin 's/,$//' | tr -d '\"'"
fi

OUTPUT_REDIRECT="cat"
if [ -n "$CSV_APPEND_FILE" ]; then
    OUTPUT_REDIRECT="cat >> $CSV_APPEND_FILE"

    # prep the CSV_APPEND_FILE if it already exists
    if [ -e "$CSV_APPEND_FILE" ]; then
        # Backup existing CSV_APPEND_FILE
        now=`date +"%Y%m%d_%H%M%S"`
        cp $CSV_APPEND_FILE $CSV_APPEND_FILE.$now

        # Clean out all existing records for the year in CSV_APPEND_FILE
        $sed_bin -i '/'$PREPEND_YEAR'/d' $CSV_APPEND_FILE
    fi
fi


# main procedure:
# 1 - Dump the input file as a pipe (|) delimited CSV.  Since there are commas
#     in some msa names, this makes it easier for us to have selectable columns
#     for code and name.
# 2 - Output a two column normal CSV (code and name) where name is quoted
# 3 - Optionally add the year as a third column before the other two
# 4 - Output to stdout or optionally append to the specified file
eval \
    $dump_cmd | \
    awk -F'|' '{print $'$CODE_COLUMN'",\""$'$NAME_COLUMN'"\""}' | \
    $sed_bin "$sed_tweaks" | \
    awk '{if ("'$PREPEND_YEAR'") printf "'$PREPEND_YEAR',"; print $0}' | \
    eval $OUTPUT_REDIRECT


if [ -n "$CSV_APPEND_FILE" ]; then
    # integrate the new records in CSV_APPEND_FILE
    # sort alphabetically be MSA code then year
    sort -n --field-separator=',' -k2 -k1 $CSV_APPEND_FILE -o $CSV_APPEND_FILE

    # if you have issues running the command above, your version of
    # sort may prefer this syntax for ordering: --key=2,1
fi
