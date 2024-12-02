import Fastify from 'fastify';

const fastify = Fastify({
  logger: true
});

fastify.get('/', (request, reply) => 'Example of a server to demonstrate a function calling');

fastify.post('/indicators', (request, reply) => {
  const { name, date: strDate } = request.body;
  const date = new Date(Date.parse(strDate));
  switch(name) {
    case 'store':
      return 3 * (date.getMonth() * 100 + date.getDate());
    case 'money':
      return 5 * (date.getMonth() * 100 + date.getDate());
    default:
      return 0;
  };
});

const start = async () => {
  try {
    await fastify.listen({ port: process.env.PORT || 3000, host: process.env.HOST || '127.0.0.1' })
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
};

start();
