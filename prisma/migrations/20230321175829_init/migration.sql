-- CreateTable
CREATE TABLE "movies" (
    "movie_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,
    "budget" INTEGER NOT NULL,
    "dirid" INTEGER NOT NULL,

    CONSTRAINT "movies_pkey" PRIMARY KEY ("movie_id")
);

-- CreateTable
CREATE TABLE "actors" (
    "actor_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "age" INTEGER NOT NULL,

    CONSTRAINT "actors_pkey" PRIMARY KEY ("actor_id")
);

-- CreateTable
CREATE TABLE "actor_movie" (
    "mid" INTEGER NOT NULL,
    "aid" INTEGER NOT NULL,

    CONSTRAINT "actor_movie_pkey" PRIMARY KEY ("mid","aid")
);

-- CreateTable
CREATE TABLE "tvshows" (
    "show_id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,
    "no_seasons" INTEGER NOT NULL,
    "dirid" INTEGER NOT NULL,

    CONSTRAINT "tvshows_pkey" PRIMARY KEY ("show_id")
);

-- CreateTable
CREATE TABLE "actor_tvshow" (
    "aid" INTEGER NOT NULL,
    "tid" INTEGER NOT NULL,

    CONSTRAINT "actor_tvshow_pkey" PRIMARY KEY ("aid","tid")
);

-- CreateTable
CREATE TABLE "seasons" (
    "season_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "tid" INTEGER NOT NULL,

    CONSTRAINT "seasons_pkey" PRIMARY KEY ("season_id")
);

-- CreateTable
CREATE TABLE "episodes" (
    "ep_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "sid" INTEGER NOT NULL,
    "dirid" INTEGER NOT NULL,

    CONSTRAINT "episodes_pkey" PRIMARY KEY ("ep_id")
);

-- CreateTable
CREATE TABLE "directors" (
    "dir_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "age" INTEGER NOT NULL,

    CONSTRAINT "directors_pkey" PRIMARY KEY ("dir_id")
);

-- AddForeignKey
ALTER TABLE "movies" ADD CONSTRAINT "movies_dirid_fkey" FOREIGN KEY ("dirid") REFERENCES "directors"("dir_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "actor_movie" ADD CONSTRAINT "actor_movie_mid_fkey" FOREIGN KEY ("mid") REFERENCES "movies"("movie_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "actor_movie" ADD CONSTRAINT "actor_movie_aid_fkey" FOREIGN KEY ("aid") REFERENCES "actors"("actor_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tvshows" ADD CONSTRAINT "tvshows_dirid_fkey" FOREIGN KEY ("dirid") REFERENCES "directors"("dir_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "actor_tvshow" ADD CONSTRAINT "actor_tvshow_aid_fkey" FOREIGN KEY ("aid") REFERENCES "actors"("actor_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "actor_tvshow" ADD CONSTRAINT "actor_tvshow_tid_fkey" FOREIGN KEY ("tid") REFERENCES "tvshows"("show_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "seasons" ADD CONSTRAINT "seasons_tid_fkey" FOREIGN KEY ("tid") REFERENCES "tvshows"("show_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "episodes" ADD CONSTRAINT "episodes_sid_fkey" FOREIGN KEY ("sid") REFERENCES "seasons"("season_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "episodes" ADD CONSTRAINT "episodes_dirid_fkey" FOREIGN KEY ("dirid") REFERENCES "directors"("dir_id") ON DELETE RESTRICT ON UPDATE CASCADE;
