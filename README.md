# RubyImageBatch

This is a command line appliaction for batch renaming and resizing of jpg images.

# Usage

RubyImageBatch takes the current working directory for scanning for images.

    ruby rimgb.rb [maxDimension] [fileNamePattern]

- maxDimension: The maximum number of pixels for either width or height
- fileNamePattern: The file name pattern. Replaces `$` with a 1-based index
