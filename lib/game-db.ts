export async function gameDB():Promise<D1Database>{const {env}=await import('cloudflare:workers');if(!env.DB)throw new Error('Online sunucu henüz bağlı değil.');return env.DB as D1Database;}
