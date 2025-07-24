# Parcela

Este es un proyecto desarrollado en Flutter. A continuación, encontrarás las instrucciones para levantar el proyecto y la descripción detallada de la estructura de ramas utilizada para el desarrollo colaborativo.

---

## 🚀 Cómo levantar el proyecto

1. **Pre-requisitos:**
   - Tener instalado [Flutter](https://docs.flutter.dev/get-started/install) (recomendado la versión estable más reciente).
   - Tener instalado [Dart](https://dart.dev/get-dart) (usualmente incluido con Flutter).
   - Un editor como [VS Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio).

2. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/ParcelaPeru/parcela.git
   cd parcela
   ```

3. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

4. **Ejecutar la aplicación:**
   - Para correr en un emulador o dispositivo físico:
     ```bash
     flutter run
     ```
   - Para ejecutar pruebas:
     ```bash
     flutter test
     ```

---

## 🌳 Estructura de ramas

Este proyecto sigue un flujo de trabajo basado en ramas para mantener un desarrollo organizado y controlado.

| Rama         | Propósito                                                                                                                            |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **main**     | Código estable y listo para producción. Solo recibe cambios desde `release/*` o `hotfix/*`.                                          |
| **developer**| Rama de integración. Aquí se fusionan todas las funcionalidades (`feature/*`) y correcciones (`bugfix/*`).                           |
| **feature/***| Nuevas funcionalidades. Se crean desde `developer`. Ejemplo: `feature/login-form`                                                    |
| **bugfix/*** | Correcciones menores. También se crean desde `developer`. Ejemplo: `bugfix/navbar-overflow`                                          |
| **release/***| Preparación para una nueva versión. Se crean desde `developer` y se fusionan en `main`. Ejemplo: `release/1.0.0`                     |
| **hotfix/*** | Correcciones urgentes en producción. Se crean desde `main` y `developer`, y se fusionan en ambos. Ejemplo: `hotfix/crash-fix`        |

### Resumen del flujo

- **main:** Sólo para versiones listas para producción.
- **developer:** Rama base para integración de cambios.
- **feature/\***: Para desarrollo de nuevas funcionalidades.
- **bugfix/\***: Para solucionar problemas menores.
- **release/\***: Para estabilizar y lanzar versiones.
- **hotfix/\***: Para atender bugs críticos en producción.

---

## 📄 Notas adicionales

- Sigue las convenciones de nombres de rama y confirma siempre que estás trabajando sobre la rama correcta antes de iniciar un desarrollo.
- Si necesitas más detalles sobre el flujo de trabajo o tienes dudas, consulta con el equipo de desarrollo (Angel Flores Valverde)

---