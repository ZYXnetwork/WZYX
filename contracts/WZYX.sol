pragma solidity ^0.6.0;

import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";

contract WZYX is ERC20UpgradeSafe, OwnableUpgradeSafe {

    mapping(address => bool) public minters;
    uint256 public totalMinters;

    modifier onlyMinter() {
        require(minters[_msgSender()],"WZYX: Not allowed");
        _;
    }

    function initialize() public initializer {
        ERC20UpgradeSafe.__ERC20_init("Wrapped ZYX", "WZYX");
        OwnableUpgradeSafe.__Ownable_init();
        minters[_msgSender()] = true;
        totalMinters = 1;
    }

    function mint(address _to, uint256 _amount) public onlyMinter {
        _mint(_to,_amount);
    }

    function burn(uint256 amount) public {
        _burn(_msgSender(),amount);
    }

    /**** Admin functions  ****/

    function addMinter(address _minter) public onlyOwner {
        minters[_minter] = true;
        totalMinters++;
    }

    function removeMinter(address _minter) public onlyOwner {
        minters[_minter] = false;
        totalMinters--;
    }
}