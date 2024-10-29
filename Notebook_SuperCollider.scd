/*


 ▗▄▖ ▗▖    ▗▄▄▖ ▗▄▖ ▗▄▄▖ ▗▄▄▖ ▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖ ▗▄▖  ▗▄▄▖
▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌  █    █  ▐▛▚▞▜▌▐▌ ▐▌▐▌
▐▛▀▜▌▐▌   ▐▌▝▜▌▐▌ ▐▌▐▛▀▚▖▐▛▀▚▖  █    █  ▐▌  ▐▌▐▌ ▐▌ ▝▀▚▖
▐▌ ▐▌▐▙▄▄▖▝▚▄▞▘▝▚▄▞▘▐▌ ▐▌▐▌ ▐▌▗▄█▄▖  █  ▐▌  ▐▌▝▚▄▞▘▗▄▄▞▘

 by HyperFantasy

*/


// Bienvenidx al notebook del taller AlgoRitmos! En este documento encontrarás
// lo básico para empezar a experimentar con síntesis de audio con SuperCollider!


/*

      >>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<
          ⛔ IMPORTANTE! LEE ESTO!! ⛔
      >>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<

   CUIDADO CON EL VOLUMEN! ESTE NOTEBOOK PUEDE
 GENERAR RUIDOS QUE PUEDEN DAÑAR NUESTROS OÍDOS.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Para evitar dañar los oídos procura usar altavoces a volumen moderado al experimentar con SuperCollider. Usar altavoz a una distancia prudencial es mucho más preferible a usar cascos o auriculares. Si no hay otro remedio, asegúrate de bajar considerablemente el volumen general de tu ordenador.


=> Este notebook se distribuye bajo la licencia de software libre GPLv3.
   Visita https://www.gnu.org/licenses/gpl-3.0.html para más info.

*/

//
// PARTE 1: El editor
// ------------------


// Ahora mismo estamos en scide, el editor (IDE) de SuperCollider. Lo básico que tenemos que saber de scide es que nos permite escribir y evaluar código de SuperCollider, llamado "sclang", facilitándonos herramientas adicionales para esto.

// Donde estás leyendo estas líneas, podemos editar y evaluar código. Además, en la ventana superior izquierda tenemos la documentación, y debajo la ventana de mensajes.

// Antes de seguir, tenemos que "encender" el server de SuperCollider (como arrancar el motor de un coche), para esto pulsa ctr+b. Fijate en los mensajes en la ventana inferior derecha.

// Antes de continuar, coloca el cursor en la siguiente línea de código (la que empieza con "{0.25" y pulsa control y enter a la vez. cmd enter si usas mac :)
{0.25 * SinOsc.ar(TRand.ar(200, 1000, Impulse.ar(5)!2).lag(0.3))}.play
// Si todo va bien, tendrías que escuchar ruidos raros saliendo de tu ordenador. Si no escuchas nada, fíjate en la ventana de mensajes para ver los errores. Si los ruidos raros vienen de otro lado que no sea el ordenador, puede que algo no vaya bien, pero no tiene nada que ver con este taller.
// Puedes pulsar control y punto (cmd y punto para mac) a la vez para parar el ruido antes de volvernos majaras.

// ** Por cierto! Todas las líneas que empiecen con // son comentarios. Los comentarios son anotaciones o aclaraciones para los usuarios y son ignorados por SuperCollider.

//
// PARTE 2: Ejecutando código
// --------------------------

// Para evaluar código, coloca el cursor en la línea de código y presiona mayus+enter. Fíjate en la ventana de mensajes!

"Hola mundo!".postln;

// SuperCollider sigue el paradigma de programación orientado a objetos (OOP por sus siglas en inglés). En programación, los objetos encapsulan ciertas propiedades y/o funcionalidades. En este caso, el objeto es la cadena de texto (string en inglés). Los objetos tienen ciertas propiedades, y definen una serie de mensajes a los que reaccionan. Los mensajes se pasan después del punto, en este caso, pasamos el mensaje "postln" a nuestra cadena de texto.

// ** NOTA: Fíjate que todas las sentencias en SuperCollider tienen que acabar con el carácter ';', si no, SuperCollider lanzará un error.

// ** NOTA: Pon el cursor encima de "postln", y presiona ctrl+d, tendrás su documentación en la ventana superior derecha!

// Para evaluar múltiples líneas de código a la vez, tenemos que rodearlos con paréntesis:

(
"Kaixo!".postln;
"Agur!".postln;
)

// En SuperCollider el código se evalúa (estrictamente) de izquierda a derecha. Veámoslo con un ejemplo.

// Espera! No evalúes todavía el código!! Piensa en el resultado de la expresión. Bueno, ya te lo digo yo... el siguiente código debería devolver el valor 11: 1 por 10 es 10, sumamos 1, nos da 11. Ahora sí, evalúa el código y observa el resultado.

1 + 1 * 10

// WTF! SuperCollider esta mal!? No, este es un claro ejemplo de cómo SuperCollider evalúa nuestro código: de izquierda a derecha.
// Si queremos que SuperCollider calcule el producto antes que la suma, tenemos que usar paréntesis:

1 + (1 * 10)

// Uff... Ahora sí.


//
// PARTE 3: Variables
// ------------------

// Lo primero de todo, qué es una variable?
// Una variable es una caja donde podemos guardar objetos. Además, estas cajas siempre tienen un nombre (único) para referirnos a ellas. Ejemplo:

x = 10; // Guardamos el valor 10 en la variable ("caja") con el nombre "x".

// Ahora podemos usar la variable x para representar su valor:

x + 3 // Fíjate en la ventana de mensajes.

// Otro ejemplo:

(
x = "Hola";
y = "mundo!";
z = x ++ ", " ++ y; // El operador ++  encadena (junta) cadenas de texto
z.postln;
)

// Podemos definir variables con cualquier nombre más allá de un único carácter, por ejemplo, "foo". Pero para esto, el nombre de la variable tiene que comenzar con "~" (AltGr+4).

~foo = 142;
~foo;

// ** NOTA: Cuidado! No definas una variable con el nombre "s". Esta variable ya está definida (por defecto), y guarda el objeto del servidor de SuperCollider.

//
// PARTE 4: Funciones
// ------------------

// Que pasa si queremos evaluar un cacho de código más de una vez? Imagina que por algún motivo queremos imprimir "Hola mundo!" 100 veces. Copiaríamos y pegaríamos "Hola mundo".postln; 100 veces!? ... Por suerte, no.

// Las funciones son objetos que encapsulan cachos de código reutilizables:

( // Guardamos la función en la variable ~foo.
~foo = { // las funciones empiezan con '{' y terminan con '}'
	"Hola mundo!".postln;
};
)

~foo.value; // Con el mensaje "value" podemos hacer que SuperCollider ejecute la función dentro de "foo".

// Fíjate que las funciones el valor de la última expresión:
(
f = { // las funciones empiezan con '{' y terminan con '}'
	"Cuánto es 10+10?".postln;
	10 + 10;
};

f.value; // Mira la ventana de mensajes
)

// Las funciones pueden tomar valores de entrada, normalmente llamados argumentos:

(
f = {
	arg entrada; // definimos una variable para el primer argumento
	entrada + 20; // sumaremos 20 a lo que nos venga como argumento
};

f.value(21); // pasando argumentos a funciones
)

// Ejemplo con más de un argumento:
(
f = {
	arg a, b;
	a * b;
};

f.value(42, 2);
)


// También podemos:
f.value(42, b: 2);
f.value(a: 42, b: 2);

// Un ejemplo más complejo:

(
f = {
	arg a = 0, b = 0, repeat = 10;

	if(a >= b, {
		"Cuidado! 'a' tiene que ser menor que 'b'!".postln;
	}, {
		repeat.do({rrand(a, b).postln;});
	});
};
)

f.value(10, 20); // imprime 10 números aleatorios en el rango [10, 20].
f.value(b: 10, repeat: 5); // imprime 5 números aleatorios en el rango [0, 10].


//
// PARTE 5: Ruido!
// ---------------

// Ejecuta el siguiente código:

{ SinOsc.ar(440, mul: 0.2) }.play;

// Cuando te hartes, pulsa ctrl+. (control y punto a la vez). *cmd y punto en mac

// Qué está pasando:
//  1. Creamos una función (recuerda que las funciones también son objetos).
//  2. Dentro de la función creamos un objeto de tipo SinOsc usando el mensaje "ar". El mensaje ar sirve para audios.
//  3. Mandamos el mensaje "play" a la función.

// ** NOTA: Mira la documentación de "SinOsc" y "ar".

// Vamos a guardar esta función en una variable:

f = { SinOsc.ar(440, mul: 0.2) };

// Veamos el tipo de onda que se genera:

f.plot(1/440); // el mensaje plot acepta un argumento con el tiempo (en segundos) en el que queremos dibujar la señal

// Fíjate cómo la señal fluctúa de 0.2 a -0.2. Veamos el efecto del argumento add.

(
f = { SinOsc.ar(440, mul: 0.2, add: 0.2) };
f.plot(1/440);
)

// Como se puede ver, ahora la señal oscila entre 0 y 0.4. Esto es de esperar, ya que la señal original, en el rango [-1, 1], se ha multiplicado por 0.2 y luego hemos sumado 0.2.

// SuperCollider ofrece muchísimos tipos de osciladores para generar audio. Algunos de los más comunes, aparte de SinOsc son:

{ Saw.ar() }.scope(1);     // Sierra

{ Pulse.ar() }.scope(1);   // Onda cuadrada

{ Blip.ar() }.scope(1); // Zumbido

// Prueba también con: WhiteNoise, PinkNoise, Dust.ar(10)...

// Visita la siguiente página para más info: https://doc.sccode.org/Guides/Tour_of_UGens.html

//
// Mezclando
// ~~~~~~~~~

// Como es de esperar, SuperCollider nos permite mezclar diferentes señales en una. Esto es muy habitual y lo usaremos a lo largo del taller.
// Para mezclar señales, podemos sumarlas como si se trataran de números:

(
f = { SinOsc.ar(440, mul: 0.1, add: 0.1) + SinOsc.ar(450, mul: 0.2) };
f.plot(0.5);
f.scope;
f.play;
)

// ** NOTA: También podemos usar la clase Mix para el mismo propósito, pero con funcionalidades adicionales (mira en la documentación de la clase).

//
// Estéreo
// ~~~~~~~

// Si estás usando cascos o altavoces externos, habrás podido percibir que hasta ahora el sonido solo ha salido de un altavoz. Si devolvemos más de un generador de audio, se asignarán a canales diferentes. Para esto, la función devolverá una lista de generadores de audio. Las listas se crean con "[" y "]". Por ejemplo:

// ==> CUIDADO CON EL VOLUMEN DE ESTOS EJEMPLOS! <==

{ [ SinOsc.ar(440), SinOsc.ar(200) ] }.play;

// Bien! Ahora cada uno de los osciladores suena por un altavoz. De hecho, podemos visualizar las dos señales usando "plot":

{ [SinOsc.ar(440), SinOsc.ar(200)] }.plot;

// Si uno de los argumentos de un generador de audio es una lista, SuperCollider automáticamente creará múltiples instancias de este. Por lo tanto, podemos crear el mismo efecto así:
{ SinOsc.ar([440, 200]) }.play;

// ** NOTA: El operador ! crea una lista repitiendo la expresión a su izquierda tantas veces como el número que le pongamos a su derecha:

10!2; // Mira la ventana de mensajes

"Ola k ase"!4;

{rrand(10, 20)}!10;

// Por lo tanto, las siguientes expresiones son totalmente equivalentes:
{ [SinOsc.ar(440), SinOsc.ar(440)] }.play;

{ SinOsc.ar([440, 440])}.play;

{ SinOsc.ar(440!2)}.play;

{ SinOsc.ar(440)!2 }.play;


//
// Modulando
// ~~~~~~~~~

// Hasta ahora los argumentos de los osciladores que hemos definido eran valores fijos. ¿Qué pasa si, en vez de ser valores constantes, cambian a lo largo del tiempo...?

// Para nuestro primer experimento cambiaremos la amplitud (volumen) de una señal con otra:

f = { SinOsc.ar(freq: 440, mul: SinOsc.kr(freq: 1, mul: 0.5, add: 0.5) ) };

f.play; // Notas el cambio en el volumen (1Hz) del oscilador a 44Hz?

f.plot(2);
f.scope;

//utilizando la opción .scope nos permite visualizar cómo una onda afecta a la otra. Puedes usar los cursores verticales y horizontales del osciloscopio para entender mejor estos cambios de manera gráfica.

// Este tipo de modulación se conoce como Amplitude Modulation (AM). En AM, al primer oscilador, en este caso el de 440Hz se le llama "carrier", y al otro "modulator".

// Experimenta con diferentes frecuencias de carrier y modulator. Que pasa cuando subimos la frecuencia moduladora al rango de frecuencias audibles? Que pasa cuando usamos otros tipos de onda? Experimenta!

// A mitad de los años 60, John Chowning descubrió un nuevo tipo de síntesis de audio accidentalmente: modulación de frecuencia (FM: frequency modulation). Como puedes ver, el código para FM es muy similar al de AM:

// 440Hz es la frecuencia "carrier", y lo modulamos con un oscilador sinusoidal que fluctúa entre 200 y -200 a 10Hz. Por lo tanto, la frecuencia de nuestro sintetizador oscilará entre los 220Hz y 620Hz.
f = { SinOsc.ar(freq: 440 + SinOsc.kr(freq: 10, mul: 200) ) };

f.scope;
f.plot(50/440); // ** NOTA: Estira la ventana del plot horizontalmente lo máximo posible. Ves la modulación?

// Experimenta! Idea: qué pasa si también modulamos la amplitud o la frecuencia del oscilador modulador del ejemplo anterior? Añade más capas de complejidad para crear sonidos bizarros e inesperados.

// Qué pasa si modulamos la fase de un oscilador? (tip: mira en la documentación del mensaje "ar").

//
// Envelope
// ~~~~~~~~

// Hasta ahora los sintetizadores que hemos creado generan sonido sin parar. Y ¿si quisiéramos usar nuestros ruidos como si fuesen notas de un piano? Para hacer que nuestros sintetizadores solo generen audio por un instante, podemos usar envolventes (envelopes en inglés). Las envolventes controlan la amplitud de nuestro sintetizador, usando un patrón que definimos. Veamos un ejemplo:

e = Env(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 1]);
e.plot();

// ** NOTA: Ve a la documentación de "Env" para la descripción en detalle de cada argumento.

// Si aplicamos está envolvente a una señal de audio, la amplitud de la señal se modificará con respecto a esta. Todo esto se entiende mejor con un ejemplo. Empecemos con un oscilador de tipo sierra:

f = { 0.2*Saw.ar() };
f.play; f.plot(1.5);

// Al igual que todos los osciladores que hemos creado hasta ahora, suena sin parar. Ahora apliquemos la envolvente del primer ejemplo al mismo oscilador:

f = { 0.2* Saw.ar() * Env(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 1]).ar() };
f.play;
f.plot(1.5);

// Fíjate cómo la amplitud del oscilador sigue el patrón que hemos visto al visualizar la envolvente. En los primeros 0.1 segundos el volumen sube hasta el máximo, luego cae suavemente por 0.5 segundos, finalmente cayendo hasta 0 en el próximo segundo.

// Veamos otro ejemplo!

// El argumento "curve" nos permite usar diferentes formas de líneas
e = Env(levels: [0, 1, 0.5, 0], times: [0.5, 0.5, 1], curve: \welch).plot;

(
f = {
	arg freq = 440, amp = 0.5; // La función toma dos argumentos: frequencia y amplitud (volumen)
	var sig, env; // Definimos dos variables, una para la señal (el oscilador) y la otra para la envolvente

	// Creamos la señal de audio usando dos osciladores de honda cuadrada
	sig = Pulse.ar(freq, mul: 0.5) + Pulse.ar(freq+10, mul: 0.5);
	// Definimos la envolvente. Esta vez pasamos "Done.freeSelf" al mensaje "ar".
	// Esto hace que el sintentizador se borre (esto es, se libere en memoria) una vez el envelope termina.
	env = Env([0, 1, 0.5, 0], [0.5, 0.5, 1], curve: \welch).ar(doneAction: Done.freeSelf);
	// Aquí definimos lo que la función finalmente devolverá. Multiplicamos, el valor de la variable amp (que determina la amplitud de la señal final), la señal, y la envolvente. Fijate como usamos "env!2" para crear una lista de dos envolventes, esto hace que la señal final sea estereo.
	amp * sig * env!2
};

f.plot(2);
f.play;
)

// ** NOTA: Si te estas preguntando a que vienen esos "\" (barras invertidas) en el codigo:
//          Estas cosas que comienzan con "\" son simbolos. Los simbolos son objetos especiales
//          en SuperCollider. Los simbolos son cadenas de caracteres, pero al contrario de las
//          cadenas de texto, estas simempre se refieren al mismo objeto. No te preocupes si esto
//          no tiene sentido ahora, simplemente piensa que se usan para referirse como identificadores
//          o "tags". Para más info: https://doc.sccode.org/Classes/Symbol.html

// Creando sintetizadores
// ~~~~~~~~~~~~~~~~~~~~~~

// Cada vez que creamos un sintetizador usando una función, SuperCollider tiene que generarlo desde cero. Aunque esto esté bien para los experimentos que hemos hecho hasta ahora, SuperCollider ofrece formas de crear sintetizadores reutilizables, que además son más eficientes a nivel de recursos computacionales (o sea, que van más rápido).

// Crear estos sintetizadores es muy similar a lo que hemos estado haciendo hasta ahora. Para crear un sintetizador el primer paso es definir un "SynthDef", que es una "plantilla" para nuestro sinte. Para crear esta platilla, necesitaremos un nombre, y la función que lo define (una función como los que hemos usado hasta ahora).

// Veamos un ejemplo:

// ==> Paso 1: Crear la plantilla
(
// Creamos una plantilla (SynthDef) con el nombre "sine_beep" y lo guardamos en la variable "b".
b = SynthDef(\sine_beep, {

	// Aquí empieza la función que definirá nuestro sinte.

	// Tendrá dos argumentos: la frecuencia, y el volumen. Los dos tienen valores por defecto.
	arg freq = 440, amp = 0.5;

	// Definimos dos variables: uno para la señal, y otro para la envolvente.
	var sig, env;

	// Creamos la envolvente. Como le pasamos "Done.freeSelf" el sinte se borrará a sí mismo una vez termine la envolvente.
	env = Env([0,1,0], [0.01, 0.4], [5,-5]).ar(doneAction: Done.freeSelf);

	// Definimos la señal de nuestro sinte, que será una simple onda sinusoidal a la que le aplicamos la envolvente. Recuerda que el "!2" al final lo hace estéreo.
	sig = SinOsc.ar(freq: freq, mul: amp) * env!2;

	// Y esto es lo único que cambia con respecto a las funciones que hemos usado hasta ahora.
	// Lo único que hace esta línea de código es decir a dónde irá a parar la señal de nuestro sinte.
	// En este caso, la señal irá al bus 0, que corresponde con el primer canal de salida de audio (el auricular o altavoz izquierdo).
	// Como hemos dicho, la señal es estéreo, por lo que "Out" mandará la segunda señal por el segundo bus de salida (el bus 1: el canal de audio derecho).
	// No pasa nada si esto resulta algo confuso, no es muy importante para este taller.
	// Si tienes interés, puedes encontrar más información sobre buses en: https://doc.sccode.org/Tutorials/Getting-Started/11-Busses.html
	Out.ar(0, sig);
});
)

// ==> Paso 2: Registrar la plantilla

// Ya hemos creado la plantilla de nuestro sinte! Pero antes de usarlo, tenemos que registrarlo. Para esto simplemente mandamos el mensaje "add" a nuestra plantilla (que habíamos guardado en la variable "b").
b.add;

// ==> Paso 3: A jugar!

// Ahora sí! Podemos crear sintes usando la plantilla que hemos llamado "sine_beep". Simplemente, ejecuta la siguiente línea:
Synth(\sine_beep); // Ejecuta la línea múltiples veces!

// Recuerda que al definir la plantilla hemos usado dos argumentos: "freq", y "amp". Si creamos el sinte sin dar valores específicos a sus los argumentos, como en la línea de código anterior, estos tomarán su valor por defecto (especificados en la plantilla). Para crear un sinte con argumentos personalizados, usaremos una lista con el nombre del argumento seguido de su valor:

Synth(\sine_beep, [\freq, 800]); // Experimenta poniendo distintos valores

// También podemos:
Synth(\sine_beep, [\freq, 600, \amp, 0.9]); // Experimenta poniendo distintos valores

// Prueba a crear tus propios sintes! Puedes usar la plantilla anterior como base y cambiar la definición de la señal (la variable "sig"). Por ejemplo, cambia el tipo de oscilador de SinOsc a otro (Saw, Pulse, ...).


// Para más info sobre definir sintes en SuperCollider puedes visitar:
//     - https://bzoennchen.github.io/supercollider-book/chapters/supercollider/synths/2-sc-synths.html
//     - https://doc.sccode.org/Tutorials/Getting-Started/10-SynthDefs-and-Synths.html


// Secuencias
// ~~~~~~~~~~

// Espera... Este taller no se llamaba ALGORITMOS? Ya va siendo hora de un poco de ritmo!

// Ejecuta la siguiente línea de código para un pequeño espóiler:

Pbind(\degree, Pseries(0, 1, 30), \dur, 0.05).play;

// Bien, vamos allá! La primera herramienta que veremos será "Pbind". Pbind nos permite crear patrones en SuperCollider. Evalúa la siguiente línea:

Pbind(\midinote, 60).play;

// Estarás escuchando la nota MIDI 60 una vez por segundo. Prueba a cambiar la nota MIDI (el número). Que pasa si ponemos valores fuera del rango 0-127? Busca en la Wikipedia de MIDI si tienes curiosidad.

// Veamos otras formas de usar Pbind:

Pbind(\midinote, 87, \duration, 0.2).play; // Podemos usar \dur en vez de \duration.

Pbind(\degree, 0).play; // Con \degree, especificamos la nota con respecto a la nota C. La nota C es el 0, con números mayores que 0 iremos a notas a la derecha de C, y con menores que 0 (negativos) iremos hacia la izquierda.

Pbind(\freq, 440).play; // También podemos usar frecuencias directamente (Hz)

Pbind(\midinote, 45, \amp, 0.2).play; // Usa \amp para controlar la amplitud

Pbind(\midinote, 33, \legato, 0.1).play; // Juega con valores de legato, notas la diferencia?

Pbind(\instrument, \sine_beep, \midinote, 66, \legato, 0.1).play; // Usando el argumento \instrument podemos especificar qué sintetizador queremos usar. Usemos "sine_beep", el que hemos definido en la sección sobre definir sintes.

// Vamos con otra herramienta para patrones: Pseq. Pseq nos permite usar diferentes secuencias de valores para los argumentos de Pbind.

(
Pbind(
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1),
	\dur, 0.2
).play;
)


// Los argumentos que necesita Pseq son: Una lista de valores, y el número de veces en el que se va a repetir la lista. En este caso, iremos de valores desde 0 a 7 en "\degree", y solo se repetirá una vez.

// Pseq se puede usar para todos los argumentos de Pbind:
(
Pbind(
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 5),
	\dur, Pseq([0.2, 0.1, 0.1, 0.2, 0.2, 0.35], inf),
).play;
)

// Fíjate que hemos definido 5 repeticiones para \degree (las notas) e infinito (inf) repeticiones para la secuencia de duraciones. Significa esto que Pbind ejecutará nuestro patrón sin parar? No, Pbind parará cuando haya terminado su trabajo, haya terminado, esto es, al repetir 5 veces la secuencia de notas (\degree).

// Otro ejemplo!

(
Pbind(
 \degree, Pseq([0, −1, 2, −3, 4, −3, 7, 11, 4, 2, 0, −3], 5),
 \dur, Pseq([0.2, 0.1, 0.1], inf),
 \amp, Pseq([0.7, 0.5, 0.3, 0.2], inf),
 \legato, 0.4
).play;
)

// Añadamos un poco de caos! Si sustituimos Pseq por Prand, Prand elegirá uno de los valores de la lista aleatoriamente cada vez!

(
Pbind(
 \degree, Prand([2, 3, 4, 5, 6], inf),
 \dur, 0.15,
 \amp, 0.2,
 \legato, 0.1
).play;
)

// Prueba con usar Prand para los demás argumentos, como \dur y \amp.

// Otra herramienta interesante es Pwhite, que usará un número aleatorio en el rango que hemos especificado.

(
Pbind(
 \freq, Pwhite(100, 500),
 \dur, Prand([0.15, 0.25, 0.3], inf),
 \amp, 0.2,
 \legato, 0.3
).trace.play; // "trace" mostrará los valores de cada momento en la ventana de mensajes.
)

// Otras herramientas que puedes probar (mira su documentación con ctrl+d):

// Pseq
(
Pbind(
 \note, Pser([0, 2], 4),
 \dur, 0.15;
 ).play;
)

// Pxrand
(
Pbind(
 \degree, Pxrand([0, −1, −3, 7, 11, −3], 5),
 \dur, 0.4,
 \amp, 0.5,
 \legato, 0.4
).play;
)

// Pshuf
(
Pbind(
 \note, Pshuf([0, 2, 3, 5, 7, 8, 11, 12], 6),
 \dur, 0.15;
).play;
)

// Pslide
(
Pbind(
 \note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], 7, 3, 1),
 \dur, 0.15;
).play;
)

// Pseries
(
Pbind(
 \note, Pseries(0, 2, 15),
 \dur, 0.15;
).play;
)

// Pgeom
(
Pbind(
 \note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], inf),
 \dur, Pgeom(0.1, 1.1, 25);
).play;
)

// Pn
(
Pbind(
 \note, Pseq([0, Pn(2, 3), 3, Pn(5, 3), 7, Pn(8, 3), 11, 12], ),
 \dur, 0.15;
).play;
)

// Para más información sobre patrones en SuperCollider puedes visitar el capítulo II (PATTERNS) de este genial libro: https://ccrma.stanford.edu/~ruviaro/texts/A_Gentle_Introduction_To_SuperCollider.pdf

// Para más info: https://doc.sccode.org/Tutorials/A-Practical-Guide/PG_01_Introduction.html


//
// FIN!
// ~~~~

// Pues ya está! Eskerrik asko!! Felicidades por llegar hasta el final de este notebook! Esperamos que te haya gustado y que te sirva como punto de partida en tu viaje por el infinito mundo de la síntesis digital. Aquí van unos recursos que podrán ayudarte en tus siguientes pasos:

// https://github.com/madskjeldgaard/awesome-supercollider?tab=readme-ov-file#learning-resources

// Un último fragmento de código para despedirnos, hasta pronto!!
(
var durations;
SynthDef(\gabberkick, {
    var snd, freq, high, lfo;
    freq = \freq.kr(440) * (Env.perc(0.001, 0.08, curve: -1).ar * 48 * \bend.kr(1)).midiratio;
    snd = Saw.ar(freq);
    snd = (snd * 100).tanh + ((snd.sign - snd) * -8.dbamp);
    high = HPF.ar(snd, 300);
    lfo = SinOsc.ar(8, [0, 0.5pi]).range(0, 0.01);
    high = high.dup(2) + (DelayC.ar(high, 0.01, lfo) * -2.dbamp);
    snd = LPF.ar(snd, 100).dup(2) + high;
    snd = RLPF.ar(snd, 7000, 2);
    snd = BPeakEQ.ar(snd, \ffreq.kr(3000) * XLine.kr(1, 0.8, 0.3), 0.5, 15);
    snd = snd * Env.asr(0.001, 1, 0.05).ar(2, \gate.kr(1));
    Out.ar(\out.kr(0), snd * \amp.kr(0.1));
}).add;

SynthDef(\hoover, {
    var snd, freq, bw, delay, decay;
    freq = \freq.kr(440);
    freq = freq * Env([-5, 6, 0], [0.1, 1.7], [\lin, -4]).kr.midiratio;
    bw = 1.035;
    snd = { DelayN.ar(Saw.ar(freq * ExpRand(bw, 1 / bw)) + Saw.ar(freq * 0.5 * ExpRand(bw, 1 / bw)), 0.01, Rand(0, 0.01)) }.dup(20);
    snd = (Splay.ar(snd) * 3).atan;
    snd = snd * Env.asr(0.01, 1.0, 1.0).kr(0, \gate.kr(1));
    snd = FreeVerb2.ar(snd[0], snd[1], 0.3, 0.9);
    snd = snd * Env.asr(0, 1.0, 4, 6).kr(2, \gate.kr(1));
    Out.ar(\out.kr(0), snd * \amp.kr(0.1));
}).add;

durations = [1, 1, 1, 1, 3/4, 1/4, 1/2, 3/4, 1/4, 1/2];
Ppar([
    Pbind(*[
        instrument: \gabberkick,
        amp: -23.dbamp,
        freq: 60,
        legato: 0.8,
        ffreq: Pseq((0..(durations.size * 4 - 1)).normalize, inf).linexp(0, 1, 100, 4000),
        dur: Pseq(durations, inf),
        bend: Pfuncn({ |x| if(x < (1/2), 0.4, 1) }, inf) <> Pkey(\dur),
    ]),
    Pbind(*[
        instrument: \hoover,
        amp: -20.dbamp,
        midinote: 74,
        dur: durations.sum * 2,
        sustain: 7,
    ])
]).play(TempoClock(210 / 60));
)