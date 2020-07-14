pragma solidity >=0.4.21 <0.7.0;

contract Election3{

	//Model a candidate

	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}

	mapping(address => bool) public voters;
	//Fetch candidates
	mapping(uint => Candidate) public candidates;

	//Store Cndidate count
	uint public candidatesCount;

	event votedEvent (
      uint indexed _candidateId
    );

	string public candidate;

	constructor() public {

		addCandidate("Candidate 1");
		addCandidate("Candidate 2");

	}

	function addCandidate(string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {

		require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

		voters[msg.sender] = true;

		candidates[_candidateId].voteCount ++;

		emit votedEvent(_candidateId);
	}
}