type fa2_key is record [
  address : address;
  id : nat
];

type standard is
  | Fa12 of address
  | Fa2 of fa2_key;

type storage_t          is big_map(standard, nat);
type return_t           is list (operation) * storage_t;
type parameter_t        is address;

const contract_addr = ("KT1LTqpmGJ11EebMVWAzJ7DWd9msgExvHM94" : address)

function main(const _user : parameter_t; var _storage : storage_t) : return_t is block
{
    const fa12_token = Fa12(contract_addr);
    const fa2_token = Fa2(record[
      address = contract_addr;
      id = 0n;
    ]);
    
    const container = big_map[
        fa12_token -> 7n;
        fa2_token -> 42n;
    ];

    storage := container;
    
} with ((nil : list(operation)), storage)
