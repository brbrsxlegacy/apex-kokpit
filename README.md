# APEX / Kokpit

BRBRS Games için kokpitten oynanan 3D yarış ve drift oyunu.

- AI çizimli şeffaf kokpit, hareketli direksiyon, hız göstergesi ve vites kolu
- 3 turluk yarış, 3 bot; 90 saniyelik drift seansı
- Otomatik / manuel 6 vites, el freni, motor sesi
- Klavye ve çoklu dokunmatik mobil kontroller
- 6 karakterlik oda kodu; 8 oyuncuya kadar online yarış ve drift
- Online oyuncu konumları 350 ms aralıklarla HTTP üzerinden paylaşılır ve görüntüde yumuşatılır. Rekabetçi anti-cheat yoktur; arkadaşlarla oynama prototipidir.

## Çalıştırma

Node.js 22.13+ ve pnpm gerekir.

```sh
pnpm install
pnpm dev
```

Kontroller: WASD / yön tuşları, Boşluk el freni, Q/E vites, R piste dön, Esc duraklatma.

## Sunucu ve veri tabanı

Online için Cloudflare Workers uyumlu Vinext sunucusu ve `DB` adlı D1 bağlaması gerekir. `drizzle/0000_adorable_menace.sql` dosyasını D1 veri tabanına uygulayın. Mantıksal bağlama `.openai/hosting.json` içinde tanımlıdır. Geliştirmede Vite Cloudflare eklentisi yerel DB sağlar; yerel şemayı `pnpm build && pnpm exec wrangler d1 execute DB --config dist/server/wrangler.json --local --persist-to .wrangler/state --file=drizzle/0000_adorable_menace.sql` ile uygulayın.

```sh
pnpm exec tsc --noEmit
pnpm build
```

Yeni Sites yayın sınırı dolu olduğu için bu sürümün canlı URL'si oluşturulamadı. Kaynak ve Worker çıktısı hazırdır. Online modun internet üzerinden kullanılabilmesi için sunucu + D1 yayını gerekir; statik hosting tek başına yeterli değildir.

## Sınırlar

Tek pist ve basitleştirilmiş sürüş fiziği. Kokpit görseli AI ile üretildi. Direksiyon, vites ve 3D pist çalışma sırasında çizilir. Online sonuçlar istemciden gelir; hile koruması ve para ödüllü rekabet için uygun değildir. Botlar sabit yarış çizgisi izler.

Doğrulama: TypeScript, üretim derlemesi, hızlanma/fren/drift zamanlayıcısı ve gerçek yerel D1 üzerinde iki oyunculu oda API akışı geçti. Tarayıcı üzerinden görsel/oynanış kontrolü bu ortamda yapılamadı.
