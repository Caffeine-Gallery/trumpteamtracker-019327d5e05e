import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Appointee {
  'previousExperience' : string,
  'name' : string,
  'education' : string,
  'biography' : string,
  'imageUrl' : string,
  'position' : string,
}
export interface _SERVICE {
  'getAppointees' : ActorMethod<[], Array<Appointee>>,
  'searchAppointees' : ActorMethod<[string], Array<Appointee>>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
