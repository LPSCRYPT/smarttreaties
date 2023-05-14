pragma solidity >=0.7.0 <0.9.0;
// import { IBaseTreaty } from './IBaseTreaty';

contract Emitter  {

    event NewTreaty(address treaty, string title);

    event NewAgreement(address treaty, string uri);

    event UserAdded(address treaty, address user);

    event Joined(address from, address to);

    function emitTreaty(address _treaty, string memory _title) external {
        //@todo verify caller is valid treaty contract
        emit NewTreaty(_treaty, _title);
    }

    function emitAgreement(address _treaty, string memory _uri) external {
        emit NewAgreement(_treaty, _uri);
    }

    function emitUser(address _treaty, address _user) external {
        emit UserAdded(_treaty, _user);
    }

    function emitJoined(address _from, address _to) external {
        emit Joined(_from, _to);
    }

}

