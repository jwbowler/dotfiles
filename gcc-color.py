# -*- coding: latin-1 -*-

from pygments.formatters import TerminalFormatter
from pygments.lexer import RegexLexer, bygroups
from pygments.token import Generic, Text, Name, Number, Other
from pygments.style import Style
from pygments import highlight

import sys
import os
import subprocess

class GccLexer(RegexLexer):
    name = 'gcc'
    # aliases = ['gcc']
    # filenames = ['*.gcc']

    tokens = {
        'root': [
            # Matches: <file>:<line>: error: <text>
            (r'(.*)(:)(.*)(:)(.*)(:)( error)(:.*\n)', 
                bygroups( Name, Text, Other, Text, Number, Text, Generic.Error, Text ) ),

            # Matches: <file>:<line>: note: <text>
            (r'(.*)(:)(.*)(:)( note)(:.*\n)', 
                bygroups( Name, Text, Number, Text, Generic.Note, Text ) ),

            # Matches: <file>:<line>: warning: <text>
            (r'(.*)(:)(.*)(:)( warning)(:.*\n)', 
                bygroups( Name, Text, Number, Text, Generic.Warning, Text ) ),

            # Matches: In file included<file>: <text>
            (r'(In file included from [^:]*)(:)(.*)([:,]*\n)', 
                bygroups( Name, Text, Number, Text ) ),

            # Matches: <file>: <text>
            (r'([^:]*)(:.*:\n)', 
                bygroups( Name, Text ) ),

            (r'.*\n', Text),
        ]
    }


colours = {
        Generic.Error :     ( 'red', 'red' ),
        Generic.Note :      ( 'brown', 'brown' ),
        Generic.Warning :   ( 'yellow', 'yellow' ),
        Name :              ( 'teal', 'teal' ),
        Number :            ( 'white', 'white' ),
        Text :              ( 'lightgray', 'lightgray' ),
        Other :             ( 'green', 'green' )
        }

do_highlight = not os.environ.has_key( "GCC_NO_HIGHLIGHT" )

pipe = subprocess.Popen( sys.argv[1:], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

while True:

    line = pipe.stdout.readline()

    if not line:
        break

    if do_highlight:
        output = highlight( line, GccLexer(), TerminalFormatter( colorscheme=colours ) )
        sys.stderr.write( output.encode( "latin-1" ) )

    else:
        sys.stderr.write( line )

pipe.wait()

sys.exit( pipe.returncode )

