using UnityEngine;

namespace Beta
{
    public class Configurator : MonoBehaviour
    {
        [SerializeField] Camera _mainCamera;

        void Start()
        {
            #if !UNITY_EDITOR

            // Enable multi-display mode.
            if (Display.displays.Length > 1)
            {
                Display.displays[0].Activate();
                Display.displays[1].Activate();
                _mainCamera.targetDisplay = 1;
            }

            #endif
        }
    }
}
