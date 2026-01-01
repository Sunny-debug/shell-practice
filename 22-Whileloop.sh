#!/bin/bash

# COUNT=5

# while [ $COUNT -gt 0 ]; do
#     echo "Time Left: $COUNT"
#     sleep 1
#     COUNT=$((COUNT - 1))    
# done

# echo "Time's up!!!!"

#!/bin/bash

# Assign the file name to a variable

# Check if the file exists
    # Use a while loop with read to process the file line by line
while IFS= read -r line; do
        # Process the line stored in the variable $line
    echo "Line read: $line"
        # Add your custom commands here
done < 19-script1.sh