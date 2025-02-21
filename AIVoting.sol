// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIVotingAdvisor {
    
    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[3] private candidates;
    address private owner;

    mapping(address => bool) private hasVoted;

    function initializeCandidates() public {
        require(owner == address(0), "Candidates already initialized");
        owner = msg.sender;
        candidates[0] = Candidate("Alice", 0);
        candidates[1] = Candidate("Bob", 0);
        candidates[2] = Candidate("Charlie", 0);
    }

    function vote(uint candidateIndex) public {
        require(candidateIndex < 3, "Invalid candidate index");
        require(!hasVoted[msg.sender], "You have already voted");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    function getRecommendedCandidate() public view returns (string memory) {
        uint maxVotes = 0;
        uint index = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                index = i;
            }
        }
        return candidates[index].name;
    }
}
