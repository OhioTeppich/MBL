/**
 * pilates-exercise controller
 */

import { factories } from '@strapi/strapi'
import { favoriteHandler } from '../../favorite/utils/favorite-handler';


export default factories.createCoreController('api::pilates-exercise.pilates-exercise', ({ strapi }) => ({
  async find(ctx) {
    let { data, meta } = await super.find(ctx);
    data = await favoriteHandler('pilates', ctx.request.headers.authorization, data);
    return { data: data, meta };
  }

}));
