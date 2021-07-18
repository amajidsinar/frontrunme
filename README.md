# FrontRunMe

FrontRunMe is a simple front-running simulation in the Ethereum blockchain, heavily inspired from [Scott Bigelow's 'How To Get Front-Run on Ethereum mainnet'](https://www.youtube.com/watch?v=UZ-NNd6yjFM&t=878s&ab_channel=ScottBigelow)


# Overview
The task is fairly simple. The smart contract itself is deployed with the encrypted result of an input string using a keccak256 hash function. Anyone that can guess the correct input string will be rewarded by N ETH supplied during the deployment. Now this gets interesting, since anybody can submit their guess on the Ethereum mainnet. But the frontrunner won't even think about this. Instead, they will listen to the transaction in the mempool, and once someone had submitted the correct answer(even the original deployer itself), the frontrunner would copy the transaction, and bid with a higher gas price so it would be included in the blockchain first, hence collecting the reward even though the frontrunner didn't even guess a single time. What's more interesting is that the frontrunner can be frontrunned by other party by bidding higher gas fee.

# Further Question
### Why don't we use Openzeppelin's onlyOwner by inheriting from the [Ownable](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol)?
To simulate real world, we must make sure that anyone can call the function. If only the owner can call the function, this will break the real purpose of the simulation. 
