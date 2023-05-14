pragma solidity >=0.7.0 <0.9.0;
import { IBaseTreaty } from './IBaseTreaty.sol';
import { Emitter } from './Emitter.sol'; 

abstract contract BaseTreaty is IBaseTreaty {

    Emitter public EMITTER_CONTRACT;

    string public TITLE;

    uint256 public agreementCount;

    mapping(uint256 => string) agreements;

    mapping(address => bool) userActive;

    mapping(address => bool) joinedTreaties;

    constructor(string memory _title, string memory _initAgreement, Emitter _emitter) {
        EMITTER_CONTRACT = _emitter;
        TITLE = _title;
        addUser(msg.sender);
        _addAgreement(_initAgreement);
        EMITTER_CONTRACT.emitTreaty(address(this), _title);
    }

    function addAgreement(string memory _agreement) public {
        _preAgreement(_agreement);
        _addAgreement(_agreement);
        _postAgreement(_agreement);
    }

    function addAgreement(string memory _agreement, bytes memory _args) public {
        _preAgreement(_agreement, _args);
        _addAgreement(_agreement);
        _postAgreement(_agreement, _args);
    }

    function addUser(address _user) public {
        _preUser(_user);
        _addUser(_user);
        _postUser(_user);
    }

    function addUser(address _user, bytes memory _args) public {
        _preUser(_user, _args);
        _addUser(_user);
        _postUser(_user, _args);
    }

    function join(address _treaty) public {
        _preJoin(_treaty);
        _join(_treaty);
        _postJoin(_treaty);
    }

    function join(address _treaty, bytes memory _args) public {
        _preJoin(_treaty, _args);
        _join(_treaty);
        _postJoin(_treaty, _args);
    }

    function proposeConditionalJoin(address _treaty) public {
        // if external treaty is pending a Conditional join, then execute for both
        // if external treaty is not pending a Conditional join, then execute
        // tbd
        _prePropose(_treaty);
        _join(_treaty);
        _postPropose(_treaty);
    }

    function proposeConditionalJoin(address _treaty, bytes memory _args) public {
        // tbd
        _prePropose(_treaty, _args);
        _join(_treaty);
        _postPropose(_treaty, _args);
    }

    function _addAgreement(string memory _agreement) internal {
        agreements[agreementCount] = _agreement;
        agreementCount++;
        EMITTER_CONTRACT.emitAgreement(address(this), _agreement);
    }

    function _addUser(address _user) internal {
        userActive[_user] = true;
        EMITTER_CONTRACT.emitUser(address(this), _user);
    }

    function _join(address _treaty) internal {
        IBaseTreaty treatyJoin = IBaseTreaty(_treaty);
        joinedTreaties[_treaty] = true;
        EMITTER_CONTRACT.emitJoined(address(this), _treaty);
    }

    function _preAgreement(string memory _agreement) internal virtual {}

    function _preAgreement(string memory _agreement, bytes memory _args) internal virtual {}

    function _postAgreement(string memory _agreement) internal virtual {}

    function _postAgreement(string memory _agreement, bytes memory _args) internal virtual {}

    function _preUser(address _user) internal virtual {}

    function _preUser(address _user, bytes memory _args) internal virtual {}

    function _postUser(address _user) internal virtual {}

    function _postUser(address _user, bytes memory _args) internal virtual {}

    function _preJoin(address _treaty) internal virtual {}

    function _preJoin(address _treaty, bytes memory _args) internal virtual {}

    function _postJoin(address _treaty) internal virtual {}

    function _postJoin(address _treaty, bytes memory _args) internal virtual {}

    function _prePropose(address _treaty) internal virtual {}

    function _prePropose(address _treaty, bytes memory _args) internal virtual {}

    function _postPropose(address _treaty) internal virtual {}

    function _postPropose(address _treaty, bytes memory _args) internal virtual {}

}

