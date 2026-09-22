import { Inject, Injectable } from '@nestjs/common';
import { Pool } from 'pg';
import Redis from 'ioredis';
import { PG_POOL } from './database/database.constants';
import { REDIS_CLIENT } from './redis/redis.constants';

@Injectable()
export class AppService {
  constructor(
    @Inject(PG_POOL) private readonly pool: Pool,
    @Inject(REDIS_CLIENT) private readonly redis: Redis,
  ) {}

  getHello(): string {
    return 'Hello World!';
  }

  async getHealth() {
    const [postgres, redis] = await Promise.all([
      this.pool.query('SELECT 1').then(
        () => 'ok' as const,
        () => 'error' as const,
      ),
      this.redis.ping().then(
        () => 'ok' as const,
        () => 'error' as const,
      ),
    ]);

    return { postgres, redis };
  }
}
