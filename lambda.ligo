function unwrap_or(
  const param           : option(nat);
  const default         : nat)
                        : nat is
  case param of
  | Some(instance) -> instance
  | None -> default
  end;

type storage_t          is nat;
type return_t           is list (operation) * storage_t;
type parameter_t        is address;

const admin = ("tz1iA1iceA1iceA1iceA1iceA1ice9ydjsaW" : address)

function main(const user : parameter_t; var storage : storage_t) : return_t is block
{
    const container = big_map[
        admin -> 7n;
    ];

    const prev_amt = unwrap_or(container[user], 0n);
    const admin_amt = unwrap_or(container[admin], 0n);

    storage := prev_amt + admin_amt;
    
} with ((nil : list(operation)), storage)
