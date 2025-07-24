# 🅿️ Arquitectura Parcela

Aplicación Flutter para alquilar espacios de estacionamiento, con autenticación, verificación de identidad, chat en tiempo real y pagos integrados.

---

## 🧱 Arquitectura General

| Componente                  | Tecnología                            |
|----------------------------|----------------------------------------|
| Frontend                   | Flutter                                |
| Backend                    | Firebase + Cloud Functions (Node.js)   |
| Base de Datos              | Firestore (NoSQL)                      |
| Autenticación              | Firebase Authentication                |
| Verificación de Identidad  | Firebase Storage + n8n + OCR API       |
| Almacenamiento de Imágenes| Firebase Storage                       |
| Chat en Tiempo Real        | Firestore Realtime Listeners           |
| Notificaciones             | Firebase Cloud Messaging (FCM)         |
| Pagos (tarjetas)           | Stripe / MercadoPago / IzyPay          |
| Pagos (Yape/Plin)          | API bancaria + Microservicio Node.js   |
| Mapa                       | Google Maps SDK                        |

---

## 🔐 Autenticación

- Registro con email, celular y contraseña.
- Verificación por código de 4 dígitos (email, SMS o WhatsApp).
- Firebase Authentication + Cloud Functions para envío de código.

---

## 🪪 Verificación de Identidad

1. Usuario sube imágenes del documento (DNI, Pasaporte, Carnet).
2. Se almacenan en Firebase Storage.
3. Cloud Function activa webhook de n8n.
4. n8n valida con servicio OCR (ej. Google Vision).
5. Resultado se actualiza en Firestore.

---

## 💬 Chat

- Firestore con listeners en tiempo real.
- Colección: `chats/{chatId}/messages`.

---

## 📍 Mapa

- Google Maps con marcadores de estacionamientos disponibles.
- Integración con `google_maps_flutter`.

---

## 💳 Pagos

### Tarjetas
- Stripe / MercadoPago / IzyPay.
- SDKs integrados en Flutter.

### Yape / Plin (API Bancaria)
- Microservicio en Node.js o Cloud Function.
- Consulta periódica o webhook de pagos entrantes.
- Verifica referencia única por reserva.
- Actualiza estado de reserva en Firestore.

---

## 📦 Almacenamiento

- Firebase Storage:
  - Imágenes de estacionamientos.
  - Documentos de identidad.
  - Vouchers de pago (si aplica).

---

## 🔔 Notificaciones

- Firebase Cloud Messaging (FCM).
- Envío de alertas entre anfitrión y viajero.

---

## ⚙️ CI/CD

- Codemagic o GitHub Actions:
  - Análisis estático (`dart analyze`)
  - Tests unitarios y de widgets
  - Build y despliegue automático

---

## 📌 Requisitos Previos

- Cuenta Firebase configurada
- Cuenta Google Maps API
- Cuenta Stripe / MercadoPago / IzyPay
- Cuenta empresarial con API bancaria (Yape/Plin)
- Instancia de n8n (local o en la nube)

---

## 🧠 Próximos Pasos

- Implementar microservicio Node.js para pagos Yape/Plin.
- Configurar OCR en n8n para validación automática de documentos.
- Agregar roles y permisos con Firebase Custom Claims.
