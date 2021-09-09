pragma solidity 0.6.12;

import "./libs/ERC20.sol";
import "./libs/AccessControl.sol";
import "./libs/ERC20Burnable.sol";
import "./libs/ERC20Pausable.sol";


contract ONUSToken is AccessControl, ERC20Burnable, ERC20Pausable {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    address private masterWallet = 0x4102a799B5b87Db21F7707e2Cc2789330254397F;

    constructor() public ERC20("ONUS", "ONUS") {
        ERC20._mint(masterWallet, 40000000 * 10 ** 18);
        _setupRole(PAUSER_ROLE, _msgSender());
    }

    function pause() public virtual {
        require(hasRole(PAUSER_ROLE, _msgSender()), "ERC20Pausable: must have pauser role to pause");
        _pause();
    }

    function unpause() public virtual {
        require(hasRole(PAUSER_ROLE, _msgSender()), "ERC20Pausable: must have pauser role to unpause");
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20, ERC20Pausable) {
        super._beforeTokenTransfer(from, to, amount);
    }

}
