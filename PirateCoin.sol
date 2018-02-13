pragma solidity ^0.4.11;

Contract PirateCoin {
	
	struct Query {
		address author;
		string query;
		uint reward;
		bool accepted;
		uint acceptedAnswer;
	}

	Query[] public queries;

	function PirateCoin(uint initialSupply) public {
		balance[msg.sender] = initialSupply;
	}

	function postQuery(string _query) public payable {
		require(msg.sender.balance >= msg.value);
		queries.push(Query({
			author: msg.sender,
			query: query,
			reward: msg.value
		}));
	}

	function accept(uint _post, uint _acceptedAnswer) public {
		require(_post <= queries.length && !queries[_post].accepted);
		queries[_post].accepted = true;
		queries[_post].acceptedAnswer = _acceptedAnswer;

		msg.sender.transfer(queries[_post].reward);
	}
}