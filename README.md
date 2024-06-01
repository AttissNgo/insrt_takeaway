# Thought Process:

5000 'genomes' is a lot of data to store on-chain. Does it really have to be this way?

I propose to bypass storing the genomes on chain, instead calculating them from a random seed supplied during deployment. The maximum values are written into the bytecode, so the only storage we use is the random seed. We can then calculate the attribute values using bitwise operations. We can still use a struct to conveniently represent the various attributes. This implementation only requires 23194 gas to "read" the attributes of a given token. 

If this is not possible - say for example the values have to be generated individually off-chain for some reason - then I believe the best way to store them would be as an array of uint96 values, unpacking them in a similar way to `_unpackAttributes()`, but using bitwise operations consistent with uint96 and without the need to adjust the values (as we assume they will be provided within the limits). Seems expensive though...


