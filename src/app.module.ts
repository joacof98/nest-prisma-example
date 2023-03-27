import { Module } from '@nestjs/common';
import { MoviesModule } from './movies/movies.module';
import { PrismaModule } from './prisma/prisma.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [ConfigModule.forRoot(), MoviesModule, PrismaModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
