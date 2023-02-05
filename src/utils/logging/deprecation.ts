import type { Dict } from '../types';

// A map of warning messages already fired
const warnings: Dict<boolean> = {};

/**
 * Helper for warning developers about deprecated features & settings.
 * A stack track for warnings is given; useful for tracking-down where
 * deprecated methods/properties/classes are being used within the code.
 * @memberof PIXI.utils
 * @function deprecation
 * @param {string} version - The version where the feature became deprecated
 * @param {string} message - Message should include what is deprecated, where, and the new solution
 * @param {number} [ignoreDepth=3] - The number of steps to ignore at the top of the error stack
 *        this is mostly to ignore internal deprecation calls.
 */
export function deprecation(version: string, message: string, ignoreDepth = 3): void
{
    // Ignore duplicat
    if (warnings[message])
    {
        return;
    }

    /* eslint-disable no-console */
    let stack = new Error().stack;

    // Handle IE < 10 and Safari < 6
    if (typeof stack === 'undefined')
    {
        print('PixiJS Deprecation Warning: ', `${message}\nDeprecated since v${version}`);
    }
    else
    {
        // chop off the stack trace which includes PixiJS internal calls
        stack = stack.split('\n').splice(ignoreDepth).join('\n');

        print('PixiJS Deprecation Warning: ', `${message}\nDeprecated since v${version}`);
        print(stack);
    }
    /* eslint-enable no-console */

    warnings[message] = true;
}
