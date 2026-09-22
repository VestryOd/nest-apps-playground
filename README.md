# Nest Apps Playground

Учебный pet-проект: бэкенд каталога мини-приложений (авторы публикуют приложения, пользователи их устанавливают, в том числе платные).

## Что демонстрирует проект

- Работу с PostgreSQL **без ORM** — все запросы написаны руками через `pg` с параметризацией (`$1, $2, ...`)
- Ручные транзакции: `BEGIN` / `COMMIT` / `ROLLBACK` с явным получением и возвратом соединения из пула
- Блокировку строк (`SELECT ... FOR UPDATE`) для защиты от гонок при покупке приложений
- JWT-аутентификацию с ротацией refresh-токенов и обнаружением их повторного использования
- Guard'ы и декораторы NestJS для проверки ролей и владения ресурсом
- Кэширование в Redis с инвалидацией после коммита транзакции
- Обработку вебхуков Stripe с проверкой подписи и идемпотентностью (опционально)

## Стек

NestJS, TypeScript, PostgreSQL (`pg`), Redis (`ioredis`), JWT, Jest + supertest.

## Запуск

```bash
cp .env.example .env
cp .env.test.example .env.test

docker compose up -d

npm install
npm run migrate

npm run start:dev
```

Проверка, что приложение видит обе базы: `GET http://localhost:3000/health` — должен вернуть `{ "postgres": "ok", "redis": "ok" }`.

## Тесты

```bash
npm run test        # unit
npm run migrate:test && npm run test:e2e   # e2e (нужна тестовая база nest_apps_test)
```

## Структура

- `src/database` — пул соединений PostgreSQL (`DatabaseModule`) и скрипт миграций
- `src/redis` — клиент Redis (`RedisModule`)
- `src/config` — конфигурация через переменные окружения
- `migrations/` — пронумерованные `.sql`-файлы схемы базы
