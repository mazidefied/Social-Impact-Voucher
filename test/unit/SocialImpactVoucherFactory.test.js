const { ethers } = require("hardhat");
const { parseEther } = ethers.utils;
require("chai").should();


/**
 * @title - SocialImpactVouchFactory contract
 */ 
describe("SocialImpactVoucherFactory.sol", async () => {
  
    //@dev - Smart contract instances
    let socialImpactVoucherFactory, userManager, dai, unionToken, uToken;

    //@dev - Smart contract addresses
    let MARKET_REGISTRY    // MarketRegistry.sol
    let UNION_TOKEN        // UnionToken.sol
    let UNDERLYING_TOKEN   // Underlying Token 

    //@dev - Non Profit Organization (wallet address)
    let NON_PROFIT_ORGANIZATION

    before(async () => {

        //@dev - Mainnet-forking test
        await network.provider.request({
            method: "hardhat_reset",
            params: [
                {
                    forking: {
                        jsonRpcUrl:
                          "https://eth-mainnet.alchemyapi.io/v2/" + 
                          process.env.ALCHEMY_API_KEY,
                        blockNumber: 14314100, // UNION mainnet deployment
                    },
                },
            ],
        });

        [OWNER, STAKER_A, STAKER_B, STAKER_C, USER, nonProfitOrganization] = await ethers.getSigners();

        NON_PROFIT_ORGANIZATION = nonProfitOrganization.address 

        MARKET_REGISTRY = "0x1ddB9a1F6Bc0dE1d05eBB0FDA61A7398641ae6BE"   // MarketRegistry.sol
        UNION_TOKEN = "0x5Dfe42eEA70a3e6f93EE54eD9C321aF07A85535C"       // UnionToken.sol
        UNDERLYING_TOKEN = "0x6b175474e89094c44da98b954eedeac495271d0f"  // Underlying Token 

        const SocialImpactVoucherFactory = await ethers.getContractFactory("SocialImpactVoucherFactory");
        socialImpactVoucherFactory = await SocialImpactVoucherFactory.deploy()
    })

    it("createNewSocialImpactVoucher()", async () => {
        let tx = await socialImpactVoucherFactory.createNewSocialImpactVoucher(MARKET_REGISTRY,   // MarketRegistry.sol
                                                                             UNION_TOKEN,       // UnionToken.sol
                                                                             UNDERLYING_TOKEN,  // Underlying Token 
                                                                             NON_PROFIT_ORGANIZATION  // Non Profit Organization (wallet address)
                                                                           )

        let txReceipt = await tx.wait()
    })

})