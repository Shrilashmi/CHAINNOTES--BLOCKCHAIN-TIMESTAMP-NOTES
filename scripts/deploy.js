const { ethers } = require("hardhat");

async function main() {
    const Notes = await ethers.getContractFactory("Notes");
    const notes = await Notes.deploy();

    await notes.waitForDeployment();

    console.log("Notes Contract deployed to:", await notes.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});