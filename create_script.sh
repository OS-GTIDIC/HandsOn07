#!/bin/bash

filename=$1 

# If variable not set or null, use default.
filename="${1:-s}"  

# If the file with name scriptname exists we delete the content.
echo "#!/bin/bash" > "$filename.sh"

# Make it executable
chmod +x "$filename.sh"

# Afegir ruta al path i crear alias.

