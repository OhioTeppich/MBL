import { Favorite } from '../models/favorite';
import { getJWTData } from '../../../utils/jwt/getJWTData';

type contentTypes = 'pilates' | 'meditation';
export const favoriteHandler = async (contentType: contentTypes, authorizationHeader: string | undefined, data: any): Promise<Array<Favorite>> => {
  const decodedJWT = getJWTData(authorizationHeader);
  const userId = decodedJWT.id

  const userFavorites: Array<Favorite> = await strapi.db.query('api::favorite.favorite').findMany({
    where: {
      userId: userId,
      contentType: contentType
    },
    select: ['userId', 'contentId'],
  });

  data = data.map((exercise) => {
    exercise.attributes.isFavorite = !!userFavorites.find((favorites) => favorites.contentId === `${exercise.id}`)
    return exercise.attributes
  });

  return data;
}
