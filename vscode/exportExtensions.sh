#!/bin/bash

code --list-extensions | xargs -L 1 echo code --install-extension > installExtensions.sh

sed -i '1s/^/#!\/bin\/bash\n\n/' installExtensions.sh
