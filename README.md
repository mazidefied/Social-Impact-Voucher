# Social Impact Voucher (built on Union Finance)
## Overview
- This is the smart contract for realizing `social impact voucher` that supporter members (who trust NPOs) can vouch for NPO members and NPO members can borrow vouched-amount of assets from their credit line.
  - Social Impact Voucher smart contract is built on Union Finance: https://docs.union.finance/protocol-overview/plain-english-overview
  - Social Impact Voucher smart contract bring alternative way of fundraising to NPOs (Non Profit Orginaizations).
    - This is not the way of using bond like SIB (Social Impact Bond) but the way of using voucher based on off-chain trust as SIV (Social Impact Voucher).
    - Once supporter members (who trust NPOs) vouch for NPO members, NPO members can borrow vouched-amount of assets from their credit line.
  - A use case of `"Many -> 1"` in use cases of Union Finance is used in this smart contract:
    https://docs.union.finance/protocol-overview/master

<br>

## Workflow
- NOTE:
  - Once a NPO user register as a NPO member, they receive a `NPO NFT` as a proof of NPO member.
    - Only `NPO NFT` holder can receive vouched-amount in uDAI (uToken).

<br>

- Diagram of workflow
  ![workflow_social-impact-voucher](https://user-images.githubusercontent.com/19357502/182022530-bd383c6d-2e0c-45ca-acb1-3f9ad3f63fcf.jpeg)

<br>

## Installation
- 1. Install modules
```
yarn
```

<br>

- 2. Compile smart contracts
```
yarn compile
```

<br>

## Test (Mainnet-forking test)
- Scenario Test
```
yarn test-scenario:SocialImpactVoucher
```

<br>

## Demo
- Demo video of scenario test: https://youtu.be/-t6G3bHOHRM


<br>

## Resources
- Union Finance📈
  - SCs：https://github.com/unioncredit
    - Union Protocol V1 SDK：https://github.com/unioncredit/union-v1-sdk
    - Deployed-addresses：https://docs.union.finance/developers/overview

  - Docs:
    - Union Contracts Overview  
      https://docs.union.finance/developers/union-contracts-overview

    - Voucher Example  
      https://docs.union.finance/developers/union-sdk

    - Key Protocol activities  
      https://docs.union.finance/protocol-overview/plain-english-overview

    - Use cases  
      https://docs.union.finance/protocol-overview/plain-english-overview

    - What does Union do that wasn’t previously possible?  
      https://docs.union.finance/protocol-overview/master

  - Workshop
    - Union Finance 🛠 Masters of Credit:Building Smart Contracts that can Borrow and Lend without Collateral  
      https://youtu.be/h5Eynrw9EC4

<br>

- EthCC Hack 2022 Paris: 
  - Union Finance channel on Discord: https://discord.com/channels/983106014637355089/998970729947222096
  - Devpost: https://ethcchack2022.devpost.com/