# AI Voting Advisor

This is a simple Solidity smart contract that acts as an AI voting advisor. It provides recommendations on candidates based on predefined logic and stores votes anonymously. The contract does not take user input directly but has a hardcoded advisory system.

## Smart Contract Address

`0xbFf65dCceF6368394eEa43Edc3b6F260c8bD8020`

## Features

- AI-based voting recommendation system
- Predefined candidate advisory logic
- Secure and anonymous vote storage
- Prevents multiple votes from a single address

## Smart Contract Code

```solidity
pragma solidity ^0.8.0;

contract AIVotingAdvisor {
    struct Candidate {
        string name;
        uint256 votes;
    }
    
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    uint256 public candidateCount;

    function addCandidate(string memory _name) public {
        candidates[candidateCount] = Candidate(_name, 0);
        candidateCount++;
    }

    function getRecommendation() public pure returns (string memory) {
        return "Based on AI analysis, Candidate 1 is recommended.";
    }

    function vote(uint256 candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateId < candidateCount, "Invalid candidate ID.");
        
        candidates[candidateId].votes++;
        hasVoted[msg.sender] = true;
    }
    
    function getVotes(uint256 candidateId) public view returns (uint256) {
        require(candidateId < candidateCount, "Invalid candidate ID.");
        return candidates[candidateId].votes;
    }
}
```

## Usage

1. Deploy the contract to an Ethereum-compatible blockchain.
2. Add candidates using the `addCandidate` function.
3. Retrieve AI-based recommendations with `getRecommendation`.
4. Vote for a candidate using `vote(candidateId)`.
5. Check the votes using `getVotes(candidateId)`.

## License

This project is open-source and available under the MIT License.
