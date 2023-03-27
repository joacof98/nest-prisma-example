import { Injectable } from '@nestjs/common';
import { Episode, Movie } from '@prisma/client';
import { DirectorDTO } from 'src/dto/director.dto';
import { Filters } from 'src/interfaces/filter.interface';
import { PrismaService } from 'src/prisma/services/prisma.service';

@Injectable()
export class MoviesService {
    constructor(private prisma: PrismaService){}

    async getMovies(filters: Filters, sort: string) {
        let movies: Movie[] = [];

        let sorts: any[] = [];
        if(sort === "budget" || sort === "year") {
            sorts.push({sort: 'desc'})
        }

        movies = await this.prisma.movie.findMany({
            orderBy: sorts,
            where: {
                name: {
                    equals: filters.name
                },
                genre: {
                    equals: filters.genre
                }
            }
        })
        
        return movies;
    }

    async getEpisode(id: string) {
        if(id !== undefined) {
            const episodeData: Episode = await this.prisma.episode.findUnique({
              where: {
                ep_id: Number(id),
              },
              include: {
                director: true
              }
            });
    
            return episodeData;
        } else {
            // Tip for here: use a custom exception
            return "Please provide an ID to search the episode"
        }
    }

    async addDirector(director: DirectorDTO) {
        const newDirector = await this.prisma.director.create({
            data : director
        })

        return newDirector;
    }
}
