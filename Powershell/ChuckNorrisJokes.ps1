# This script's only purpose is to output a random Chuck Norris joke
#
# Author: Austin Howell
# Date: 02/03/2019

(Invoke-RestMethod -Method Get -Uri http://api.icndb.com/jokes/random).value.joke
