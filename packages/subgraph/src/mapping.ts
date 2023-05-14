// ts-nocheck
import { BigInt, Address } from "@graphprotocol/graph-ts";
import {
  Emitter,
  NewTreaty,
  NewAgreement,
  UserAdded,
  Joined
} from "../generated/Emitter/Emitter";
import { Account, Treaty, Membership } from "../generated/schema";

export function handleNewTreaty(event: NewTreaty): void {
  let id = event.params.treaty.toHexString();
  let treaty = new Treaty(id);
  treaty.title = event.params.title;
  treaty.agreements = [];
  treaty.joined = [];
  treaty.save();
  }


export function handleNewAgreement(event: NewAgreement): void {
  let id = event.params.treaty.toHexString();
  let treaty = Treaty.load(id);
  if (treaty != null) {
      let arr = treaty.agreements;
      arr!.push(event.params.uri);
      treaty.agreements = arr;
    treaty.save();
  }
}

export function handleUserAdded(event: UserAdded): void {
  let id = event.params.user.toHexString();
  let account = Account.load(id);
  if (account === null) {
    account = new Account(id);
    account.save();
  }
  let treatyid =  event.params.treaty.toHexString();
  let memid = treatyid + " " + id;
  let membership = Membership.load(memid);
  if (membership === null) {
    membership = new Membership(memid);
    membership.address = id;
    membership.treaty = treatyid;
  }
  membership.save();
}

export function handleJoined(event: Joined): void {
  let id = event.params.from.toHexString();
  let to = event.params.to.toHexString();
  let treaty = Treaty.load(id);
  if (treaty !== null) {
    let arr = treaty.joined;
    arr!.push(to);
    treaty.joined = arr;
    treaty.save();
  }
}
