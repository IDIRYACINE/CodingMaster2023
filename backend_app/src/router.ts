import "reflect-metadata";
import { PrismaClient } from "@prisma/client";
import { ApolloServer } from "@apollo/server";
import { startStandaloneServer } from "@apollo/server/standalone";
import { buildSchema } from "type-graphql";
import { resolvers } from "../prisma/generated/type-graphql";

interface Context {
    prisma: PrismaClient;
}

interface Url{
    url: string;
}

export async function bootstrapGraphQl() : Promise<Url>{
    const schema = await buildSchema({
        resolvers,
        validate: false,
    });

    const server = new ApolloServer<Context>({
        schema,

    });

    const prisma = new PrismaClient();

    return await startStandaloneServer(server, {
        listen: { port: 4000 },
        context : async () => {return {prisma}}
    });

}