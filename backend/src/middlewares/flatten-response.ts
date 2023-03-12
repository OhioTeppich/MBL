import { has, forEach, isObject, isArray } from 'lodash';

const removeObjectKey = (object, key) => ({
  id: object.id,
  ...object[key],
});

const traverse = (data) => {
  if (has(data, 'attributes')) {
    return traverse(removeObjectKey(data, 'attributes'));
  }
  if (has(data, 'data')) {
    return traverse(removeObjectKey(data, 'data'));
  }

  // if(!has(data, 'attributes')) {
  //   Object.entries(data).forEach((key, value) => {
  //     console.log('##', key, value);
  //   })
  // }

  forEach(data, (value, key) => {
    if (!value) return;

    if (isObject(value)) {
      data[key] = traverse(value);
    }
  });
  return data;
}

async function respond(ctx, next) {
  await next();
  if (!ctx.url.startsWith('/api') || ctx.url.startsWith('/api/auth')) {
    return;
  }
  console.log(`API request (${ctx.url}) detected, transforming response json...`);
  ctx.response.body = {
    data: traverse(ctx.response.body.data),
    meta: ctx.response.body.meta
  };
}

module.exports = () => respond;
