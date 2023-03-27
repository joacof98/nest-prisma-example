import { Module } from '@nestjs/common';
import { PrismaModule } from 'src/prisma/prisma.module';
import { MoviesController } from './controllers/movies.controller';
import { MoviesService } from './services/movies.service';

@Module({
  imports: [PrismaModule],
  controllers: [MoviesController],
  providers: [MoviesService]
})
export class MoviesModule {}
