// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Notes {

    struct Note {
        string text;
        uint timestamp;
        string username; // 🔥 NEW
    }

    Note[] public notes;

    function addNote(string memory _text, string memory _username) public {
        notes.push(Note(_text, block.timestamp, _username));
    }

    function getNotes() public view returns (Note[] memory) {
        return notes;
    }

    function deleteNote(uint index) public {
        require(index < notes.length, "Invalid index");

        for (uint i = index; i < notes.length - 1; i++) {
            notes[i] = notes[i + 1];
        }

        notes.pop();
    }
}