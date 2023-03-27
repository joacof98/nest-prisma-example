import { Controller, Get, Post, Query } from '@nestjs/common';
import { Body } from '@nestjs/common/decorators';
import { DirectorDTO } from 'src/dto/director.dto';
import { Filters } from 'src/interfaces/filter.interface';
import { MoviesService } from '../services/movies.service';

@Controller('')
export class MoviesController {
    constructor(private moviesService: MoviesService){}
    
    @Get('/movies')
    async getMovies(@Query() query) {
        const filters: Filters = {
            name: query.name,
            genre: query.genre
        }
        const sort: string = query.sort_by;

        return await this.moviesService.getMovies(filters, sort);
    }

    @Get('/episode')
    getEpisodeData(@Query() query) {
        return this.moviesService.getEpisode(query.ep_id);
    }

    @Post('/director')
    addDirector(@Body() directorDto: DirectorDTO) {
        return this.moviesService.addDirector(directorDto);
    }
}
