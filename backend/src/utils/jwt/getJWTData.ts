import { IncomingHttpHeaders } from 'http2';

export const getJWTData = (authorization: string | undefined) => {
  if(!authorization) return undefined;
  const jwt = authorization.replace('Bearer ', '');
  const decodedJwt = JSON.parse(Buffer.from(jwt.split('.')[1], 'base64').toString());
  return decodedJwt;
}
