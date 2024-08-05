// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Params {
    bool public initialized;

    // System contracts
    address
        public constant ValidatorContractAddr = 0x000000000000000000000000000000000000f000;
    address
        public constant PunishContractAddr = 0x000000000000000000000000000000000000F001;
    address
        public constant ProposalAddr = 0x000000000000000000000000000000000000F002;

    // System params
    uint16 public MaxValidators = 2000;
    // Validator have to wait StakingLockPeriod blocks to withdraw staking
    uint64 public constant StakingLockPeriod = 28800;
    // Validator have to wait WithdrawProfitPeriod blocks to withdraw his profits
    uint256 public  MinimalStakingCoin = 500 ether;
    // minimum initial staking to become a validator
    uint256 public  minimumValidatorStaking = 50000 ether;


    // percent distrubution of Gas Fee earned by validator 100000 = 100%
    uint public  stakerPartPercent = 30000;          //30%
    uint public  validatorPartPercent = 30000;        //30%
    uint public  burnPartPercent = 10000;                //10%
    uint public OwnerPartPercent = 30000;           //30%
    uint public  contractPartPercent = 0;        //0%
    uint public  burnStopAmount = 50000000 ether;      // after 50000000 coins burn, it will stop burning
    uint public totalBurnt;



    modifier onlyMiner() {
        require(msg.sender == block.coinbase, "Miner only");
        _;
    }

    modifier onlyNotInitialized() {
        require(!initialized, "Already initialized");
        _;
    }

    modifier onlyInitialized() {
        require(initialized, "Not init yet");
        _;
    }

    modifier onlyPunishContract() {
        require(msg.sender == PunishContractAddr, "Punish contract only");
        _;
    }

    modifier onlyBlockEpoch(uint256 epoch) {
        require(block.number % epoch == 0, "Block epoch only");
        _;
    }

    modifier onlyValidatorsContract() {
        require(
            msg.sender == ValidatorContractAddr,
            "Validators contract only"
        );
        _;
    }

    modifier onlyProposalContract() {
        require(msg.sender == ProposalAddr, "Proposal contract only");
        _;
    }
}
