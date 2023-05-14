pragma solidity >=0.7.0 <0.9.0;
import { BaseTreaty } from './BaseTreaty.sol';
import { Emitter } from './Emitter.sol'; 

contract SimpleTreaty is BaseTreaty {

    constructor(string memory _title, string memory _initAgreement, Emitter _emitter) BaseTreaty(_title, _initAgreement, _emitter) {}

    function _preAgreement(string memory _agreement) internal override virtual {}

    function _preAgreement(string memory _agreement, bytes memory _args) internal override virtual {}

    function _postAgreement(string memory _agreement) internal override virtual {}

    function _postAgreement(string memory _agreement, bytes memory _args) internal override virtual {}

    function _preUser(address _user) internal override virtual {}

    function _preUser(address _user, bytes memory _args) internal override virtual {}

    function _postUser(address _user) internal override virtual {}

    function _postUser(address _user, bytes memory _args) internal override virtual {}

    function _preJoin(address _treaty) internal override virtual {}

    function _preJoin(address _treaty, bytes memory _args) internal override virtual {}

    function _postJoin(address _treaty) internal override virtual {}

    function _postJoin(address _treaty, bytes memory _args) internal override virtual {}

    function _prePropose(address _treaty) internal override virtual {}

    function _prePropose(address _treaty, bytes memory _args) internal override virtual {}

    function _postPropose(address _treaty) internal override virtual {}

    function _postPropose(address _treaty, bytes memory _args) internal override virtual {}

}

