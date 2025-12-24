// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UserProfileStore {
    struct UserProfile {
        string name;
        uint256 age;
    }

    mapping(address => UserProfile) private profiles;

    event ProfileUpdated(address indexed user, string name, uint256 age);

    function updateProfile(string calldata name, uint256 age) external {
        profiles[msg.sender] = UserProfile({ name: name, age: age });
        emit ProfileUpdated(msg.sender, name, age);
    }

    function getProfile(address user) external view returns (string memory, uint256) {
        UserProfile memory profile = profiles[user];
        return (profile.name, profile.age);
    }
}
