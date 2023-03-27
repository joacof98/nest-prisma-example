import { IsString, IsNumber } from "class-validator"

export class DirectorDTO {
    @IsString()
    name: string

    @IsString()
    lastname: string
    
    @IsNumber()
    age: number
}