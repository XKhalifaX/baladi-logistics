import 'dotenv/config';
import { defineConfig } from '@prisma/config';

console.log("Checking DB URL:", process.env.DATABASE_URL); // ADD THIS LINE

export default defineConfig({
  datasource: {
    url: process.env.DATABASE_URL,
  },
});