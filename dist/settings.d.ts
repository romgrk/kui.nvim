import { Context2D, Canvas } from 'src/context2d';
export declare const settings: {
    RESOLUTION: number;
    ROUND_PIXELS: boolean;
    RENDER_OPTIONS: {
        view: null;
        width: number;
        height: number;
        autoDensity: boolean;
        backgroundColor: number;
        backgroundAlpha: number;
        clearBeforeRender: boolean;
        antialias: boolean;
        premultipliedAlpha: boolean;
        preserveDrawingBuffer: boolean;
        hello: boolean;
    };
    ADAPTER: {
        getCanvasRenderingContext2D: () => typeof Context2D;
        createCanvas: (width: number, height: number) => Canvas;
    };
};
export default settings;
