export const idlFactory = ({ IDL }) => {
  const Appointee = IDL.Record({
    'name' : IDL.Text,
    'imageUrl' : IDL.Text,
    'position' : IDL.Text,
  });
  return IDL.Service({
    'getAppointees' : IDL.Func([], [IDL.Vec(Appointee)], ['query']),
    'searchAppointees' : IDL.Func([IDL.Text], [IDL.Vec(Appointee)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
