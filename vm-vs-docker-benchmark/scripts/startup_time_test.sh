#!/bin/bash
START=$(date +%s)
docker run --rm ubuntu echo "Container started"
END=$(date +%s)
echo "Startup time: $((END - START)) seconds"
