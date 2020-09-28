#!/bin/bash
# Usage: bq dataset-table time-in-seconds
bq cp &quot;$1@$(((`date +%s`-$2)*1000))&quot; $1_recovered
