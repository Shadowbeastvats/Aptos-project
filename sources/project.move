module MyModule::SharedNFT {
    use aptos_framework::signer;
    use aptos_framework::aptos_account;
    
    /// Struct representing a shared NFT collection.
    struct NFTCollection has key, store {
        owner: address,
        name: vector<u8>,
    }
    
    /// Function to create a new shared NFT collection.
    public fun create_collection(creator: &signer, name: vector<u8>) {
        let collection = NFTCollection {
            owner: signer::address_of(creator),
            name,
        };
        move_to(creator, collection);
    }
    
    /// Function to mint an NFT into a shared collection.
    public fun mint_nft(minter: &signer, collection_owner: address, token_name: vector<u8>)
    acquires NFTCollection {
        let _collection = borrow_global_mut<NFTCollection>(collection_owner);
        // Logic to register NFT minting (Placeholder: Extend as needed)
    }
}
